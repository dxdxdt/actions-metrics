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
Updated: 2026-03-24T09:49:09.355133+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.816 |  |
| ap-east-2 | 0.754 |  |
| ap-northeast-1 | 0.634 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.657 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.844 |  |
| ap-southeast-5 | 0.907 |  |
| ap-southeast-6 | 0.860 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.107 | 16 |
| ca-west-1 | 0.290 |  |
| eu-central-1 | 0.379 |  |
| eu-central-2 | 0.399 |  |
| eu-north-1 | 0.433 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.301 |  |
| eu-west-2 | 0.333 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.753 |  |
| me-south-1 | 0.716 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.479 |  |
| us-east-1 | 0.048 | 4347 |
| us-east-2 | 0.085 | 1449 |
| us-gov-east-1 | 0.086 | 1600 |
| us-gov-west-1 | 0.309 | 190 |
| us-west-1 | 0.268 | 3289 |
| us-west-2 | 0.326 | 151 |

