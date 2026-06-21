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
Updated: 2026-06-21T15:08:17.680873+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.788 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.834 |  |
| ap-south-2 | 0.880 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.916 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.883 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.130 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.429 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.468 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.409 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.789 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.095 | 4781 |
| us-east-2 | 0.103 | 1636 |
| us-gov-east-1 | 0.110 | 1716 |
| us-gov-west-1 | 0.272 | 198 |
| us-west-1 | 0.211 | 3688 |
| us-west-2 | 0.272 | 163 |

