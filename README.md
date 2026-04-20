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
Updated: 2026-04-20T18:55:18.643739+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.654 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.800 |  |
| ap-southeast-3 | 0.932 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.842 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.139 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.082 | 4533 |
| us-east-2 | 0.108 | 1519 |
| us-gov-east-1 | 0.115 | 1657 |
| us-gov-west-1 | 0.299 | 194 |
| us-west-1 | 0.244 | 3449 |
| us-west-2 | 0.295 | 156 |

