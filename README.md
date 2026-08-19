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
Updated: 2026-08-19T05:22:14.484212+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.578 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.831 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.850 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.115 | 18 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.447 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.098 | 5019 |
| us-east-2 | 0.097 | 1680 |
| us-gov-east-1 | 0.071 | 1851 |
| us-gov-west-1 | 0.283 | 224 |
| us-west-1 | 0.192 | 3993 |
| us-west-2 | 0.282 | 182 |

