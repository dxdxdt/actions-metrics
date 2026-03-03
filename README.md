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
Updated: 2026-03-03T07:37:59.605735+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.583 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.628 |  |
| us-east-1 | 0.184 | 4212 |
| us-east-2 | 0.162 | 1393 |
| us-gov-east-1 | 0.169 | 1524 |
| us-gov-west-1 | 0.179 | 169 |
| us-west-1 | 0.143 | 3162 |
| us-west-2 | 0.182 | 136 |

