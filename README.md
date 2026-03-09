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
Updated: 2026-03-09T10:38:35.797183+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.021 |  |
| ap-east-1 | 0.688 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.661 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.864 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.562 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.170 | 4246 |
| us-east-2 | 0.142 | 1410 |
| us-gov-east-1 | 0.143 | 1547 |
| us-gov-west-1 | 0.166 | 176 |
| us-west-1 | 0.154 | 3201 |
| us-west-2 | 0.163 | 144 |

