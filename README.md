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
Updated: 2026-07-03T21:59:37.107893+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.886 |  |
| ap-southeast-2 | 0.771 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.983 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.297 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.322 |  |
| eu-west-2 | 0.355 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.072 | 4815 |
| us-east-2 | 0.100 | 1652 |
| us-gov-east-1 | 0.103 | 1728 |
| us-gov-west-1 | 0.305 | 200 |
| us-west-1 | 0.239 | 3735 |
| us-west-2 | 0.304 | 164 |

