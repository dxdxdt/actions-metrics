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
Updated: 2026-04-23T21:39:20.941770+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.015 |  |
| ap-east-1 | 0.680 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.860 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.570 |  |
| eu-north-1 | 0.588 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.487 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.709 |  |
| me-central-1 | 0.892 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.638 |  |
| us-east-1 | 0.178 | 4549 |
| us-east-2 | 0.185 | 1527 |
| us-gov-east-1 | 0.174 | 1662 |
| us-gov-west-1 | 0.184 | 194 |
| us-west-1 | 0.125 | 3466 |
| us-west-2 | 0.184 | 157 |

