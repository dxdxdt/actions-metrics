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
Updated: 2026-06-10T07:01:27.832244+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.866 |  |
| ap-east-1 | 0.814 |  |
| ap-east-2 | 0.748 |  |
| ap-northeast-1 | 0.632 |  |
| ap-northeast-2 | 0.750 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.886 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.942 |  |
| ap-southeast-4 | 0.848 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.098 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.376 |  |
| eu-central-2 | 0.402 |  |
| eu-north-1 | 0.424 |  |
| eu-south-1 | 0.410 |  |
| eu-south-2 | 0.406 |  |
| eu-west-1 | 0.297 |  |
| eu-west-2 | 0.334 |  |
| eu-west-3 | 0.354 |  |
| il-central-1 | 0.533 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.050 | 4739 |
| us-east-2 | 0.088 | 1630 |
| us-gov-east-1 | 0.093 | 1710 |
| us-gov-west-1 | 0.336 | 198 |
| us-west-1 | 0.273 | 3653 |
| us-west-2 | 0.331 | 162 |

