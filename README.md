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
Updated: 2026-09-27T14:27:52.008241+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.874 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.872 |  |
| ap-southeast-4 | 0.747 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.748 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.164 | 18 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.483 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.130 | 5124 |
| us-east-2 | 0.122 | 1687 |
| us-gov-east-1 | 0.130 | 1930 |
| us-gov-west-1 | 0.219 | 236 |
| us-west-1 | 0.177 | 4141 |
| us-west-2 | 0.209 | 192 |

