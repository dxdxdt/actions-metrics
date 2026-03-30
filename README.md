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
Updated: 2026-03-30T11:51:03.376794+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.578 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.765 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.509 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.424 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.783 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.565 |  |
| us-east-1 | 0.120 | 4398 |
| us-east-2 | 0.133 | 1466 |
| us-gov-east-1 | 0.149 | 1615 |
| us-gov-west-1 | 0.258 | 190 |
| us-west-1 | 0.204 | 3320 |
| us-west-2 | 0.256 | 152 |

