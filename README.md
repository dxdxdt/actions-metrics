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
Updated: 2026-03-08T18:23:36.842487+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.785 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.601 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.626 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.828 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.424 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.787 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.506 |  |
| us-east-1 | 0.070 | 4242 |
| us-east-2 | 0.082 | 1409 |
| us-gov-east-1 | 0.087 | 1546 |
| us-gov-west-1 | 0.279 | 175 |
| us-west-1 | 0.247 | 3195 |
| us-west-2 | 0.278 | 144 |

