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
Updated: 2026-06-21T05:55:24.387741+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.776 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.598 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.832 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.874 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.411 |  |
| il-central-1 | 0.590 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.102 | 4780 |
| us-east-2 | 0.120 | 1636 |
| us-gov-east-1 | 0.131 | 1715 |
| us-gov-west-1 | 0.271 | 198 |
| us-west-1 | 0.220 | 3687 |
| us-west-2 | 0.273 | 163 |

