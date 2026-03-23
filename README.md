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
Updated: 2026-03-23T04:22:34.885458+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.614 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.702 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.251 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.545 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.493 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.916 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.181 | 4336 |
| us-east-2 | 0.184 | 1447 |
| us-gov-east-1 | 0.186 | 1595 |
| us-gov-west-1 | 0.190 | 189 |
| us-west-1 | 0.128 | 3284 |
| us-west-2 | 0.191 | 151 |

