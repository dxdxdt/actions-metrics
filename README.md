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
Updated: 2026-04-19T22:28:07.171031+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.873 |  |
| ap-east-1 | 0.802 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.734 |  |
| ap-northeast-3 | 0.648 |  |
| ap-south-1 | 0.848 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.886 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.848 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.309 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.399 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.301 |  |
| eu-west-2 | 0.340 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.565 |  |
| me-central-1 | 0.758 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.053 | 4529 |
| us-east-2 | 0.080 | 1516 |
| us-gov-east-1 | 0.093 | 1657 |
| us-gov-west-1 | 0.308 | 194 |
| us-west-1 | 0.266 | 3445 |
| us-west-2 | 0.321 | 156 |

