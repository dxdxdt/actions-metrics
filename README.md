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
Updated: 2026-02-24T16:58:09.048029+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.922 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.710 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.960 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.897 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.850 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.484 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.764 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.530 |  |
| us-east-1 | 0.079 | 4178 |
| us-east-2 | 0.065 | 1376 |
| us-gov-east-1 | 0.071 | 1504 |
| us-gov-west-1 | 0.253 | 161 |
| us-west-1 | 0.220 | 3111 |
| us-west-2 | 0.248 | 130 |

