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
Updated: 2026-03-27T18:45:55.917153+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.081 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.572 |  |
| ap-northeast-1 | 0.456 |  |
| ap-northeast-2 | 0.564 |  |
| ap-northeast-3 | 0.482 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.707 |  |
| ap-southeast-2 | 0.594 |  |
| ap-southeast-3 | 0.765 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.652 |  |
| ap-southeast-7 | 0.809 |  |
| ca-central-1 | 0.302 | 16 |
| ca-west-1 | 0.179 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.610 |  |
| eu-north-1 | 0.655 |  |
| eu-south-1 | 0.615 |  |
| eu-south-2 | 0.649 |  |
| eu-west-1 | 0.510 |  |
| eu-west-2 | 0.558 |  |
| eu-west-3 | 0.570 |  |
| il-central-1 | 0.760 |  |
| me-central-1 | 0.952 |  |
| me-south-1 | 0.909 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.709 |  |
| us-east-1 | 0.245 | 4371 |
| us-east-2 | 0.225 | 1458 |
| us-gov-east-1 | 0.223 | 1609 |
| us-gov-west-1 | 0.121 | 190 |
| us-west-1 | 0.066 | 3310 |
| us-west-2 | 0.121 | 151 |

