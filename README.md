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
Updated: 2026-05-22T10:18:57.061061+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.592 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.835 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.814 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.371 |  |
| eu-west-2 | 0.403 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.546 |  |
| us-east-1 | 0.092 | 4673 |
| us-east-2 | 0.078 | 1606 |
| us-gov-east-1 | 0.083 | 1700 |
| us-gov-west-1 | 0.276 | 195 |
| us-west-1 | 0.206 | 3587 |
| us-west-2 | 0.272 | 158 |

