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
Updated: 2026-03-11T09:35:54.279586+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.155 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.654 |  |
| me-central-1 | 0.866 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.142 | 4258 |
| us-east-2 | 0.117 | 1418 |
| us-gov-east-1 | 0.116 | 1559 |
| us-gov-west-1 | 0.195 | 178 |
| us-west-1 | 0.188 | 3208 |
| us-west-2 | 0.199 | 144 |

