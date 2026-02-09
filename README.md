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
Updated: 2026-02-09T18:47:41.149586+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.083 |  |
| ap-east-1 | 0.625 |  |
| ap-northeast-1 | 0.448 |  |
| ap-northeast-2 | 0.552 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.701 |  |
| ap-southeast-2 | 0.581 |  |
| ap-southeast-3 | 0.757 |  |
| ap-southeast-4 | 0.621 |  |
| ca-central-1 | 0.310 | 16 |
| ca-west-1 | 0.167 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.618 |  |
| eu-north-1 | 0.649 |  |
| eu-south-1 | 0.635 |  |
| eu-south-2 | 0.635 |  |
| eu-west-1 | 0.522 |  |
| eu-west-2 | 0.544 |  |
| eu-west-3 | 0.581 |  |
| il-central-1 | 0.791 |  |
| me-central-1 | 0.974 |  |
| me-south-1 | 0.949 |  |
| sa-east-1 | 0.700 |  |
| us-east-1 | 0.257 | 4093 |
| us-east-2 | 0.235 | 1326 |
| us-gov-east-1 | 0.230 | 1446 |
| us-gov-west-1 | 0.107 | 141 |
| us-west-1 | 0.057 | 3030 |
| us-west-2 | 0.116 | 125 |

