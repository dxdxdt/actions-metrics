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
Updated: 2026-03-13T01:20:36.074119+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.644 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.131 | 4272 |
| us-east-2 | 0.143 | 1421 |
| us-gov-east-1 | 0.143 | 1566 |
| us-gov-west-1 | 0.234 | 180 |
| us-west-1 | 0.188 | 3217 |
| us-west-2 | 0.240 | 145 |

