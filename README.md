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
Updated: 2026-03-07T09:22:33.960224+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.938 |  |
| ap-southeast-1 | 0.791 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.173 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.656 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.139 | 4233 |
| us-east-2 | 0.123 | 1406 |
| us-gov-east-1 | 0.115 | 1536 |
| us-gov-west-1 | 0.194 | 174 |
| us-west-1 | 0.193 | 3190 |
| us-west-2 | 0.191 | 142 |

