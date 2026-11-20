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
Updated: 2026-11-20T00:04:08.323461+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.678 |  |
| ap-east-1 | 0.568 |  |
| ap-east-2 | 0.524 |  |
| ap-northeast-1 | 0.428 |  |
| ap-northeast-2 | 0.507 |  |
| ap-northeast-3 | 0.449 |  |
| ap-south-1 | 0.663 |  |
| ap-south-2 | 0.728 |  |
| ap-southeast-1 | 0.624 |  |
| ap-southeast-2 | 0.547 |  |
| ap-southeast-3 | 0.665 |  |
| ap-southeast-4 | 0.612 |  |
| ap-southeast-5 | 0.637 |  |
| ap-southeast-6 | 0.562 |  |
| ap-southeast-7 | 0.703 |  |
| ca-central-1 | 0.103 | 18 |
| ca-west-1 | 0.161 |  |
| eu-central-1 | 0.331 |  |
| eu-central-2 | 0.352 |  |
| eu-north-1 | 0.375 |  |
| eu-south-1 | 0.356 |  |
| eu-south-2 | 0.338 |  |
| eu-west-1 | 0.271 |  |
| eu-west-2 | 0.303 |  |
| eu-west-3 | 0.320 |  |
| il-central-1 | 0.449 |  |
| me-central-1 | 0.596 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.635 |  |
| mx-central-1 | 0.175 |  |
| sa-east-1 | 0.418 |  |
| us-east-1 | 0.085 | 5191 |
| us-east-2 | 0.089 | 1730 |
| us-gov-east-1 | 0.090 | 1963 |
| us-gov-west-1 | 0.191 | 247 |
| us-west-1 | 0.147 | 4220 |
| us-west-2 | 0.191 | 199 |

