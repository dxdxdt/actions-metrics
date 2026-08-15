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
Updated: 2026-08-15T08:17:59.430522+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.075 |  |
| ap-east-1 | 0.601 |  |
| ap-east-2 | 0.542 |  |
| ap-northeast-1 | 0.425 |  |
| ap-northeast-2 | 0.534 |  |
| ap-northeast-3 | 0.451 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.849 |  |
| ap-southeast-1 | 0.678 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.736 |  |
| ap-southeast-4 | 0.634 |  |
| ap-southeast-5 | 0.697 |  |
| ap-southeast-6 | 0.625 |  |
| ap-southeast-7 | 0.779 |  |
| ca-central-1 | 0.318 | 18 |
| ca-west-1 | 0.161 |  |
| eu-central-1 | 0.595 |  |
| eu-central-2 | 0.613 |  |
| eu-north-1 | 0.637 |  |
| eu-south-1 | 0.623 |  |
| eu-south-2 | 0.625 |  |
| eu-west-1 | 0.517 |  |
| eu-west-2 | 0.554 |  |
| eu-west-3 | 0.573 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.258 |  |
| sa-east-1 | 0.721 |  |
| us-east-1 | 0.267 | 4998 |
| us-east-2 | 0.267 | 1679 |
| us-gov-east-1 | 0.241 | 1829 |
| us-gov-west-1 | 0.084 | 222 |
| us-west-1 | 0.081 | 3954 |
| us-west-2 | 0.084 | 178 |

