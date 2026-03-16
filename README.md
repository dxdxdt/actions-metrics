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
Updated: 2026-03-16T23:25:07.889411+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.726 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.834 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.283 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.417 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.349 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.729 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.065 | 4294 |
| us-east-2 | 0.096 | 1429 |
| us-gov-east-1 | 0.110 | 1578 |
| us-gov-west-1 | 0.296 | 186 |
| us-west-1 | 0.258 | 3244 |
| us-west-2 | 0.309 | 148 |

