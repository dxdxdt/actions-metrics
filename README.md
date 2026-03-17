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
Updated: 2026-03-17T01:22:47.775689+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.688 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.839 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.421 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.761 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.097 | 4294 |
| us-east-2 | 0.093 | 1429 |
| us-gov-east-1 | 0.096 | 1579 |
| us-gov-west-1 | 0.245 | 186 |
| us-west-1 | 0.237 | 3244 |
| us-west-2 | 0.248 | 148 |

