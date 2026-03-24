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
Updated: 2026-03-24T17:00:54.470809+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.823 |  |
| ap-east-2 | 0.762 |  |
| ap-northeast-1 | 0.641 |  |
| ap-northeast-2 | 0.758 |  |
| ap-northeast-3 | 0.667 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.900 |  |
| ap-southeast-2 | 0.843 |  |
| ap-southeast-3 | 0.955 |  |
| ap-southeast-4 | 0.869 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.863 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.392 |  |
| eu-central-2 | 0.407 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.410 |  |
| eu-south-2 | 0.422 |  |
| eu-west-1 | 0.310 |  |
| eu-west-2 | 0.346 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.560 |  |
| me-central-1 | 0.760 |  |
| me-south-1 | 0.722 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.056 | 4352 |
| us-east-2 | 0.103 | 1449 |
| us-gov-east-1 | 0.102 | 1600 |
| us-gov-west-1 | 0.333 | 190 |
| us-west-1 | 0.289 | 3290 |
| us-west-2 | 0.344 | 151 |

