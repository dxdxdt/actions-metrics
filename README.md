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
Updated: 2026-03-03T22:21:54.736919+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.568 |  |
| ap-south-1 | 0.920 |  |
| ap-south-2 | 0.935 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.656 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.813 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.153 | 4214 |
| us-east-2 | 0.171 | 1396 |
| us-gov-east-1 | 0.141 | 1527 |
| us-gov-west-1 | 0.205 | 169 |
| us-west-1 | 0.183 | 3167 |
| us-west-2 | 0.205 | 138 |

