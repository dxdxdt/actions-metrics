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
Updated: 2026-06-24T16:10:55.391844+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.769 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.470 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.097 | 4786 |
| us-east-2 | 0.094 | 1639 |
| us-gov-east-1 | 0.093 | 1720 |
| us-gov-west-1 | 0.265 | 199 |
| us-west-1 | 0.208 | 3698 |
| us-west-2 | 0.265 | 163 |

