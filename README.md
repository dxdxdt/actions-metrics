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
Updated: 2026-02-28T19:16:21.628865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.735 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.870 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.814 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.111 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.441 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.376 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.724 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.498 |  |
| us-east-1 | 0.064 | 4201 |
| us-east-2 | 0.087 | 1384 |
| us-gov-east-1 | 0.100 | 1518 |
| us-gov-west-1 | 0.285 | 166 |
| us-west-1 | 0.250 | 3142 |
| us-west-2 | 0.299 | 134 |

