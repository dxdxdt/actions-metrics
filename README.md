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
Updated: 2026-08-19T06:29:41.431031+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.680 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.668 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.996 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.124 | 18 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.395 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.179 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.102 | 5019 |
| us-east-2 | 0.101 | 1680 |
| us-gov-east-1 | 0.087 | 1852 |
| us-gov-west-1 | 0.264 | 224 |
| us-west-1 | 0.179 | 3993 |
| us-west-2 | 0.266 | 182 |

