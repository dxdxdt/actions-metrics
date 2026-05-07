# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-05-07T02:07:26.361944+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.935 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.644 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.874 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.102 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.459 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.586 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.541 |  |
| us-east-1 | 0.084 | 4605 |
| us-east-2 | 0.070 | 1570 |
| us-gov-east-1 | 0.068 | 1679 |
| us-gov-west-1 | 0.266 | 194 |
| us-west-1 | 0.212 | 3536 |
| us-west-2 | 0.262 | 157 |

