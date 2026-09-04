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
Updated: 2026-09-04T20:07:26.861243+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.705 |  |
| ap-southeast-7 | 0.874 |  |
| ca-central-1 | 0.195 | 18 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.644 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.170 | 5084 |
| us-east-2 | 0.160 | 1685 |
| us-gov-east-1 | 0.142 | 1895 |
| us-gov-west-1 | 0.196 | 231 |
| us-west-1 | 0.147 | 4079 |
| us-west-2 | 0.192 | 192 |

