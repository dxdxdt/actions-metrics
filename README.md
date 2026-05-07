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
Updated: 2026-05-07T16:00:58.176714+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.636 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.783 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.866 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.274 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.428 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.371 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.082 | 4608 |
| us-east-2 | 0.114 | 1570 |
| us-gov-east-1 | 0.103 | 1680 |
| us-gov-west-1 | 0.277 | 194 |
| us-west-1 | 0.238 | 3537 |
| us-west-2 | 0.278 | 157 |

