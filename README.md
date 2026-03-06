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
Updated: 2026-03-06T08:29:27.360056+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.793 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.781 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.842 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.429 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.280 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.072 | 4229 |
| us-east-2 | 0.110 | 1402 |
| us-gov-east-1 | 0.116 | 1532 |
| us-gov-west-1 | 0.293 | 173 |
| us-west-1 | 0.248 | 3181 |
| us-west-2 | 0.294 | 141 |

