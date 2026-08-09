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
Updated: 2026-08-09T21:23:37.197881+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.775 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.138 | 18 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.481 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.436 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.113 | 4964 |
| us-east-2 | 0.119 | 1678 |
| us-gov-east-1 | 0.095 | 1813 |
| us-gov-west-1 | 0.245 | 214 |
| us-west-1 | 0.190 | 3915 |
| us-west-2 | 0.243 | 175 |

