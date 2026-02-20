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
Updated: 2026-02-20T06:45:18.643057+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.695 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.755 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.857 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.438 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.341 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.765 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.525 |  |
| us-east-1 | 0.087 | 4149 |
| us-east-2 | 0.108 | 1356 |
| us-gov-east-1 | 0.107 | 1493 |
| us-gov-west-1 | 0.279 | 158 |
| us-west-1 | 0.229 | 3085 |
| us-west-2 | 0.267 | 128 |

